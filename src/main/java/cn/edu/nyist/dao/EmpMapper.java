package cn.edu.nyist.dao;

import cn.edu.nyist.domain.Emp;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmpMapper {
    int deleteByPrimaryKey(Integer empId);

    int deleteEmpsByPrimaryKeys(List<Integer> empIds);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(Integer empId);

    int updateByPrimaryKeySelective(@Param("emp")Emp emp);

    int updateByPrimaryKey(Emp record);

    List<Emp> selectAll();

    long countByCondition(@Param("emp") Emp emp);

}