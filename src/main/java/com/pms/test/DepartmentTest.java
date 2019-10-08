package com.pms.test;

import com.pms.bean.Department;
import com.pms.mapper.DepartmentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class DepartmentTest {

    @Autowired
    DepartmentMapper dm;
    @Test
    public void showAll(){
        List<Department> dep = dm.selAllDept();
       // for (Department department:dep) {
            System.out.println(dep);
       // }
    }
    @Test
    public void findId(){
        Department department= dm.selectByDeptNo(2);
        // for (Department department:dep) {
        System.out.println(department);
        // }
    }
    @Test
    public void selectByDeptName(){
        String name = "";
        List<Department> dept = dm.selectByDeptName(name);
        // for (Department department:dep) {
        System.out.println(dept);
        // }
    }
    @Test
    public void selectByDeptMag(){
        String mname = "廖佳涛";
        List<Department> dept = dm.selectByDeptManager(mname);
        // for (Department department:dep) {
        System.out.println(dept);
        // }
    }
    @Test
    public void insDept(){
        String value = "网络部";
        List<Department> departments = dm.selectByDeptName(value);
        if(departments.size()==0){
            Department dept = new Department();
            dept.setDname("策划部");
            dept.setDmanager("张三");
            int count = dm.insDept(dept); //添加部门
            System.out.println(count);
        }else {
            System.out.println("添加失败");
        }

        //return count;
    }

    @Test
    public void delDept(){
        int count = dm.delDept(7);
        System.out.println(count);
        //return count;
    }

    @Test
    public void upDept(){
        Department department = new Department();
        department.setDid(6);
        department.setDmanager("曾锋楷");
        department.setDname("策划部");
        int count = dm.upDept(department);
        System.out.println(count);
        //return count;
    }
}
