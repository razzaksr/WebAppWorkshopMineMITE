<%@page import="java.io.InputStream"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.io.File"%>
<%@page import="core.mod.Candidates"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Printing</title>
</head>
<body>
<%List<Candidates> can=(List<Candidates>)pageContext.getAttribute("tobe", PageContext.APPLICATION_SCOPE); 
out.println(can);
File fgen=null;
String hai="";
try
{
	//File file = new File("buddy.jrxml");
	InputStream resourceStream = session.getServletContext().getResourceAsStream("/files/buddy.jrxml");
	JasperDesign jasperDesign = JRXmlLoader.load(resourceStream);
    //JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
    JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
    JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(can);
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("createdBy", "Razak Mohamed");
    parameters.put("createdFor", "DLithe");
    System.out.println("Received @ report end before writing "+can);
    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
    	fgen=new File("Dlithe.pdf");
        JasperExportManager.exportReportToPdfFile(jasperPrint, fgen.getAbsolutePath());
    hai="Report generated @ "+fgen.getAbsolutePath();
    System.out.println("Received @ report end after writing "+hai);
    request.setAttribute("info","Received @ report end after writing "+hai);
    response.sendRedirect("home.jsp");
}
catch(JRException j)
{j.printStackTrace();} 
/* catch (FileNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} */
%>
</body>
</html>