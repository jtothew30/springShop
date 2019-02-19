package com.spring.shop.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		
		//uuid 발급
		UUID uid = UUID.randomUUID();
		
		//uuid를 추가한 파일 이름
		String savedName = uid.toString() + "_" + originalName;
		
		//upload할 dir create
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath+savedPath, savedName);
		
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		
		//파일의 확장자 검사 .jpg , a.b.c.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		
		//이미지 파일은 썸네일 생성
		if(MediaUtils.getMediaType(formatName)!=null) {
			//썸네일생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath,savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath,savedName);	
		}
		
		return uploadedFileName;
		
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		//아이콘의 이름
		String iconName = uploadPath +path+ File.separator + fileName;
		
		//아이콘 이름을 리턴
		//File.seperatorChar : 디렉토리구분자
		//					   윈도우 \ , 유닉스계열 /
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		//이미지를 읽기위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path,fileName));
		
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		//썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		//썸네일의 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		//썸네일의 이름을 리턴
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		//자리수 01 02 03 형식
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		// 디렉토리 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		logger.info(datePath);
		return datePath;
	}
	
	// ... 가변사이즈 매개변수 [] 배열로 만들어서 paths로 생성됨
	private static void makeDir(String uploadPath, String...paths ) {
		//디렉토리가 존재하면 통과
		if (new File(paths[paths.length-1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) { // 디렉토리가 존재하지 않으면
				dirPath.mkdir(); //디렉토리 생성
				
			}
		}
	}
}
