package cn.edu.nyist.service;

import cn.edu.nyist.dao.DeptMapper;
import cn.edu.nyist.domain.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    DeptMapper deptMapper;

    public List<Dept> getDepts() {

        return  deptMapper.selectAll();
    }
}
