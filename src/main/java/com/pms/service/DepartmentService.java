package com.pms.service;

import com.pms.bean.Department;

import java.util.List;

public interface DepartmentService {

    boolean adddept(Department dept);  //添加部门

    boolean updept(Department dept); //更新部门信息

    boolean deldept(int did); //删除部门

    boolean delAll(int did);

    List<Department> findAllDept(); //查询全部部门的信息

    Department findByDeptNo(int did); //根据部门id进行查找

    List<Department> findByDeptName(String dname); //根据部门名称进行查找

    List<Department> findByDeptManager(String dmg); //根据部门主管进行查找
}
