package com.zzfly.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.zzfly.model.CustInfo;

/**
 * 导入导出工具类
 * 
 * @author zhengz.sdc
 * 
 */
public class ExportUtils {

	/**
	 * 导出Excel
	 * 
	 * @return
	 * @throws IOException
	 */
	public static void exportExcel(HttpServletResponse response,
			Map<String, Object> headInfo, List<Map<String, Object>> data,
			String fileName) throws IOException {
		// 首行需要显示字段栏位<[对象列],[字段中文]>
		// Map<String, Object> headInfo = new LinkedHashMap<String, Object>();
		// 要操作的数据集合
		// List<Map<String, Object>> data = new ArrayList<Map<String,
		// Object>>();
		// 创建一个新的Excel
		HSSFWorkbook workBook = new HSSFWorkbook();
		// 创建sheet页
		HSSFSheet sheet = workBook.createSheet();
		// sheet页名称
		workBook.setSheetName(0,
				fileName.substring(0, fileName.lastIndexOf(".") - 1));
		// 创建header页
		HSSFHeader header = sheet.getHeader();
		// 设置标题居中
		header.setCenter(fileName.substring(0, fileName.lastIndexOf(".") - 1));
		// 设置第一行为Header
		HSSFRow row = sheet.createRow(0);
		if (null != headInfo && 0 != headInfo.size()) {
			// 编历字段名设置首行数据值
			int index = 0;// 列索引
			for (String s : headInfo.keySet()) {
				row.createCell(index).setCellValue(headInfo.get(s) + "");
				index++;
			}
			// 循环遍历List集合，然后在Excel中生成数据;
			if ((null != data) && (0 != data.size())) {
				for (int i = 0; i < data.size(); i++) {
					// 正常打印数据
					Map<String, Object> map = data.get(i);
					row = sheet.createRow(i + 1);
					index = 0;
					for (String s : headInfo.keySet()) {
						row.createCell(index).setCellValue(map.get(s) + "");
						sheet.setColumnWidth(index, 4000);
						index++;
					}
				}
			}
			// 最后打印合计
			headInfo.size();
			row = sheet.createRow(data.size() + 1);
			for (int i = 0; i < headInfo.size(); i++) {
				row.createCell(i).setCellValue("");
				sheet.setColumnWidth(i, 4000);
			}
		}

		// 通过Response把数据以Excel格式保存
		response.reset();
		response.setContentType("application/msexcel;charset=UTF-8");
		try {
			// response.addHeader("Content-Disposition",
			// "attachment;filename=\""
			// + new String(("客户基本信息.xls").getBytes("GBK"), "ISO8859_1")
			// + "\"");
			// File file = new File(new String("C:/" + fileName));
			// if (!file.exists()) {
			// file.createNewFile();
			// } else {
			// file.delete();
			// file.createNewFile();
			// }
			// out = new FileOutputStream(file);
			// workBook.write(out);
			// out.flush();
			// // FileOutputStream fos = new FileOutputStream(file, true);
			// FileOutputStream fos = response.getOutputStream();
			// workBook.write(fos);
			// fos.flush();
			// fos.close();
			response.addHeader("Content-Disposition", "attachment;filename=\""
					+ new String(("客户基本信息.xls").getBytes("GBK"), "ISO8859_1")
					+ "\"");
			OutputStream out = response.getOutputStream();
			workBook.write(out);
			out.flush();
			out.close();

			// 保存到本地;
			// File file = new File(new String("D:/客户基本信息.xls"));
			// if (!file.exists()) {
			// file.createNewFile();
			// }
			// FileOutputStream fos = new FileOutputStream(file, true);
			// workBook.write(fos);
			// fos.flush();
			// fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}

	/**
	 * excel导入
	 * 
	 * @param dir
	 * @return
	 */
	public static List<CustInfo> importFromExcel(String dir) {
		List<CustInfo> lT = new ArrayList<CustInfo>();
		POIFSFileSystem fs;
		HSSFWorkbook wb = null;
		HSSFSheet sheet;
		HSSFRow row;
		HSSFRow rowSub;
		try {
			FileInputStream fis = new FileInputStream(new File(new String(dir)));
			fs = new POIFSFileSystem(fis);
			wb = new HSSFWorkbook(fs);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sheet = wb.getSheetAt(0);
		int rowNum = sheet.getLastRowNum();// 获取sheet页的总行数
		row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();// 获取cell单元格的列数
		String[] title = new String[colNum];// 获取表头数据
		for (int i = 0; i < colNum; i++) {
			// title[i] = getStringCellValue(row.getCell((short) i));
			// title[i] = row.getCellFormatValue(row.getCell((short) i));
			title[i] = row.getCell(i).getStringCellValue();
		}
		// 获取数据内容（从第二行开始）
		for (int i = 1; i <= rowNum; i++) {
			rowSub = sheet.getRow(i);
			// int j = 0;
			// while (j < colNum) {
			CustInfo ci = new CustInfo();// 暂时针对客户信息的导入
			ci.setPlateNo(rowSub.getCell(0).getStringCellValue());
			ci.setBrand(rowSub.getCell(1).getStringCellValue());
			ci.setBrandTyp(rowSub.getCell(2).getStringCellValue());
			ci.setFrameNo(rowSub.getCell(3).getStringCellValue());
			ci.setEngineNo(rowSub.getCell(4).getStringCellValue());
			ci.setCusIdNo(rowSub.getCell(5).getStringCellValue());
			ci.setCusNme(rowSub.getCell(6).getStringCellValue());
			ci.setCusAddr(rowSub.getCell(7).getStringCellValue());
			ci.setCusTel(rowSub.getCell(8).getStringCellValue());
			ci.setCusPhon(rowSub.getCell(9).getStringCellValue());
			ci.setLogDate(rowSub.getCell(10).getStringCellValue());
			lT.add(ci);
		}
		return lT;
	}
}
