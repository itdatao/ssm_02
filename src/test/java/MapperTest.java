import cn.edu.nyist.dao.DeptMapper;
import cn.edu.nyist.dao.EmpMapper;
import cn.edu.nyist.domain.Dept;
import cn.edu.nyist.domain.Emp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MapperTest {

    @Autowired
    private DeptMapper deptMapper;

   @Autowired
   private EmpMapper empMapper;
    @Test
    public void TestCRUD()
    {
       /* Dept dept = new Dept();
        dept.setDeptName("消费");*/

        //插入department
        /*int i = deptMapper.insertSelective(dept);
        System.out.println(i);//受影响的行数*/

        /*//插入emp
        int i1 = empMapper.insertSelective(new Emp(null, "憨憨", "666@123.com", "M", 9));
        if (i1>0){
            System.out.println("插入员工信息成功！");
        }
*/
        //一次向Emp中插入1000条数据

        for (int i = 0; i < 1000; i++) {
            String ename = UUID.randomUUID().toString().replace("-", "").substring(0, 4);
            empMapper.insertSelective(new Emp(null,ename+i,ename+"@qq.com","M",5));
        }
       // System.out.println("插入完成");
    }

}
