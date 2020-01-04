package cn.edu.nyist.dao;

import cn.edu.nyist.domain.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeptMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer deptId);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    List<Dept> selectAll();
}