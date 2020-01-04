package cn.edu.nyist.controller;

import cn.edu.nyist.domain.Emp;
import cn.edu.nyist.domain.Msg;
import cn.edu.nyist.service.EmpService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 处理员工请求
 */

@Controller
public class EmpController {
    @Autowired
    private EmpService empService;

    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("id") String id){

        if (id.contains(",")){
            //多项删除
            List<Integer> ids = new ArrayList<>();
            String[] strings = id.split(",");
            for (String s : strings) {
                ids.add(Integer.parseInt(s));
            }
            System.out.println(ids);
            empService.deleteEmps(ids);
        }else{
            //单项删除
            empService.deleteEmp(Integer.parseInt(id));
        }


        return Msg.success();
    }




    /**
     * 根据id更新员工信息
     * @param emp
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/put/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Emp emp){
        System.out.println("员工数据："+emp);
        empService.updateEmp(emp);

        return Msg.success();
    }


    /**
     * 根据emp的id查询员工信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id){

       Emp emp =  empService.getEmp(id);
        return Msg.success().add("emp",emp);
    }


    /**
     * 查询所有员工数据
     * @return
     */
    @RequestMapping("/getEmps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pnum", defaultValue = "1")
                               int pnum, Model model, HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException {

        //分页查询，使用分页插件,查询前只需要传入页码和页大小
        PageHelper.startPage(pnum, 6);

        List<Emp> list = empService.getAll();

        //pageInfo封装了详细的分页信息，包括查询后的结果,navigatePage表示连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);

        model.addAttribute("pageInfo", pageInfo);

        return new Msg().success().add("pageInfo", pageInfo);
    }

    /**
     * 员工保存
     *
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Emp emp, BindingResult result) {

        //后端校验
        if (!result.hasErrors()) {
            //如果没有错误就返回成功
            empService.saveEmp(emp);
            return Msg.success();
        } else {

            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误字段名：" + error.getField());
                System.out.println("错误信息：" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }


    }

    /**
     * 检查员工名是否可用
     *
     * @param empName
     * @return
     */
    @RequestMapping(value = "/checkEmp", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmp(@RequestParam("empName") String empName) {
        //在数据库校验之前，应先校验表单提交的内容是否符合规范
        //1.编写正则表达式，调用match方法判断员工名是否符合规则
        String regx = "(^[a-zA-Z0-9_-]{3,10}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)) {
            //如果不符合规范
            return Msg.fail().add("va_msg", "员工名数字与字母组合3-10位，中文2-5位！");
        }

        Emp emp = new Emp();
        emp.setEmpName(empName);
        boolean flag = empService.checkEmp(emp);
        if (flag) {
            //如果是true，代表没有重复的姓名，符合返回success
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg", "员工名重复！");
        }

    }
}
