import cn.edu.nyist.domain.Emp;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用Spring测试模块提供的请求功能，测试crud的正确性
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MvcTest {
    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testPage() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/crud/emps")
                .param("pnum", "1")).andReturn();

        //请求成功后请求域有pageInfo对象
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        int pageNum = pageInfo.getPageNum();
        System.out.println("当前页： "+pageNum);

        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("连续显示的页码： ");

        int[] nums = pageInfo.getNavigatepageNums();
        for (int i : nums) {
            System.out.println(i+" ");
        }
        
        //获取员工数据
        List<Emp> list = pageInfo.getList();

        for (Emp o : list) {
            System.out.println(o.getEmpId()+"  "+o.getEmpName()+"  "+o.getGender()+"  "+o.getEmail());
        }

    }

}
