package cn.edu.nyist.controller;

import cn.edu.nyist.domain.Dept;
import cn.edu.nyist.domain.Msg;
import cn.edu.nyist.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {
    @Autowired
    DeptService deptService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDept(){

        List<Dept> depts = deptService.getDepts();

        return Msg.success().add("depts",depts);
    }


}
