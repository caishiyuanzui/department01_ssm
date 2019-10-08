package com.pms.service.impl;

import com.pms.bean.Department;
import com.pms.mapper.DepartmentMapper;
import com.pms.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    /*
    添加部门
     */
    @Override
    public boolean adddept(Department dept) {
        int count = departmentMapper.insDept(dept);
        if (count > 0) {
            return true;
        }
        return false;
    }
/*
更新部门
 */
    @Override
    public boolean updept(Department dept) {
        int count = departmentMapper.upDept(dept);
        if(count>0){
            return true;
        }
        return false;
    }
/*
删除部门
 */
    @Override
    public boolean deldept(int did) {
        int count = departmentMapper.delDept(did);
        if(count>0){
            return true;
        }
        return false;
    }
/*
    删除员工
 */
    @Override
    public boolean delAll(int did) {
        int count = departmentMapper.delAll(did);
        if(count>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Department> findAllDept() {
        List<Department> dept = departmentMapper.selAllDept();
        if (dept!=null){
            return dept;
        }
        return null;
    }

    @Override
    public Department findByDeptNo(int did) {
        Department dp = departmentMapper.selectByDeptNo(did);
        if(dp!=null){
            return dp;
        }
        return null;
    }

    @Override
    public List<Department> findByDeptName(String dname) {
        List<Department> dp = departmentMapper.selectByDeptName(dname);
        if(dp!=null){
            return dp;
        }
        return null;
    }

    @Override
    public List<Department> findByDeptManager(String dmg) {
        List<Department> dp = departmentMapper.selectByDeptManager(dmg);
        if (dp!=null){
            return dp;
        }
        return null;
    }
}
