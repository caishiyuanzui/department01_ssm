package com.pms.mapper;

import com.pms.bean.Department;

import java.util.List;

public interface DepartmentMapper {

    List<Department> selAllDept(); //查询全部部门的信息

    Department selectByDeptNo(int did); //根据部门id进行查找

    List<Department> selectByDeptName(String dname); //根据部门名称进行查找

    List<Department> selectByDeptManager(String dmg); //根据部门主管进行查找

    int insDept(Department dept); //添加部门

    int delDept(int id); //根据部门id删除

    int upDept(Department dept); //根据部门的id进行修改

    int delAll(int did);

}
