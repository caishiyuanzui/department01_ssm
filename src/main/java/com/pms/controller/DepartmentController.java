package com.pms.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pms.bean.Department;
import com.pms.bean.Msg;
import com.pms.service.DepartmentService;
import com.pms.untl.con_Oracle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /*
    查询所有部门的信息，分页显示
    pn:分页参数,页码，默认为1
     */
    @RequestMapping("/dept")
    @ResponseBody
    public Msg ShowDeptAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn){
        int pagesize = 10;  //每页显示的数据数量
        PageHelper.startPage(pn,pagesize);  //定义开始页数码，以及每页长度
        List<Department> dep = departmentService.findAllDept();  //查询所有部门信息
        PageInfo page = new PageInfo(dep,5);  //将查询的数据封装到PageInfo
        return Msg.success().add("PageInfo",page);
    }

    /*
    根据id查询部门的信息
     */
    @RequestMapping(value = "/deptId/{deptId}",method = RequestMethod.GET)
    @ResponseBody
    public Msg FindDeptById(@PathVariable("deptId") int deptId){
        Department dept =  departmentService.findByDeptNo(deptId);
        System.out.println(dept);
        return Msg.success().add("dept",dept);
    }

    /*
    根据部门的名称查询
     */
    @RequestMapping(value = "/deptName/{deptName}",method = RequestMethod.GET)
    @ResponseBody
    public Msg FindDeptByName(@PathVariable("deptName") String deptName){
        List<Department> dept = departmentService.findByDeptName(deptName);
        System.out.println(dept);
        return Msg.success().add("dept",dept);
    }

    /*
    根据部门主管查询
     */
    @RequestMapping(value = "/deptMag/{deptMag}",method = RequestMethod.GET)
    @ResponseBody
    public Msg FindDeptByMag(@PathVariable("deptMag") String deptMag){
        List<Department> dept = departmentService.findByDeptManager(deptMag);
        System.out.println(dept);
        return Msg.success().add("dept",dept);
    }

    /*
    根据部门id删除部门,deptId:从前端获取到的id
     */
    @RequestMapping(value = "/delD/{deptId}",method = RequestMethod.DELETE)
    @ResponseBody
    @Transactional(readOnly=false,propagation= Propagation.REQUIRED,rollbackFor={Exception.class})
    public Msg DelDeptById(@PathVariable("deptId") int deptId) throws Exception {
//        Department dept =  departmentService.findByDeptNo(deptId);
//        String namevalue = dept.getDname();
        try{
            if (departmentService.deldept(deptId)){
                departmentService.delAll(deptId);
                return Msg.success();
            }else {
                return Msg.fail();
            }
        }catch (Exception e){
            throw e;
        }
    }

    /*
        添加部门信息
     */
    @RequestMapping(value = "/addD",method = RequestMethod.POST)
    @ResponseBody
    public Msg AddDept(Department dept){
        System.out.println(dept);
        String value = dept.getDname();
        List<Department> departments = departmentService.findByDeptName(value);
        System.out.println(departments);
        if (departments.size()==0){
            if (departmentService.adddept(dept)){
                return Msg.success();
            }else {
                return Msg.fail();
            }
        }else{
            return Msg.fail();
        }
    }

    /*
    修改部门的信息
     */
    @RequestMapping(value = "/updept/{did}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg UpDeptById(Department dept){
        System.out.println("########" + dept);

        if (departmentService.updept(dept)){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/connect",method = RequestMethod.GET)
    @ResponseBody
    public void Connection(){
        con_Oracle oracle = new con_Oracle();
        oracle.oracle_connection();
        System.out.println("yunxing");
    }


}
