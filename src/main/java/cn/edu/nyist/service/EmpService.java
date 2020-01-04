package cn.edu.nyist.service;

import cn.edu.nyist.dao.EmpMapper;
import cn.edu.nyist.domain.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpService {

    @Autowired
    EmpMapper mapper;

    public List<Emp> getAll() {

        return mapper.selectAll();
    }

    public void saveEmp(Emp emp) {

         mapper.insertSelective(emp);
    }

    public boolean checkEmp(Emp emp) {

        long count = mapper.countByCondition(emp);

        return count == 0;
    }

    public Emp getEmp(Integer id) {

        Emp emp = mapper.selectByPrimaryKey(id);
        return emp;
    }

    public void updateEmp(Emp emp) {

        mapper.updateByPrimaryKeySelective(emp);
    }

    public void deleteEmp(Integer id) {
        mapper.deleteByPrimaryKey(id);

    }

    public void deleteEmps(List<Integer> empIds){

        mapper.deleteEmpsByPrimaryKeys(empIds);

    }
}
