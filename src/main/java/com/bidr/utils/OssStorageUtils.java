package com.bidr.utils;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.commons.lang.StringUtils;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectRequest;
import com.aliyun.oss.model.PutObjectResult;

/**
 * 阿里云存储
 * @author lenovo
 *
 */
public class OssStorageUtils {
	 // endpoint是访问OSS的域名。如果您已经在OSS的控制台上 创建了Bucket，请在控制台上查看域名。
    // 如果您还没有创建Bucket，endpoint选择请参看文档中心的“开发人员指南 > 基本概念 > 访问域名”，
    // 链接地址是：https://help.aliyun.com/document_detail/oss/user_guide/oss_concept/endpoint.html?spm=5176.docoss/user_guide/endpoint_region
    // endpoint的格式形如“http://oss-cn-hangzhou.aliyuncs.com/”，注意http://后不带bucket名称，
    // 比如“http://bucket-name.oss-cn-hangzhou.aliyuncs.com”，是错误的endpoint，请去掉其中的“bucket-name”。
    private static String endpoint = "https://oss-cn-beijing.aliyuncs.com";
    
    private static String preFixx="https://bidr.oss-cn-beijing.aliyuncs.com";

    // accessKeyId和accessKeySecret是OSS的访问密钥，您可以在控制台上创建和查看，
    // 创建和查看访问密钥的链接地址是：https://ak-console.aliyun.com/#/。
    // 注意：accessKeyId和accessKeySecret前后都没有空格，从控制台复制时请检查并去除多余的空格。
    private static String accessKeyId = "LTAIJqxDee6SUSaM";
    private static String accessKeySecret = "qd7fSVc4Jkmkoi3MdBrGtNFgU7B64J";

    // Bucket用来管理所存储Object的存储空间，详细描述请参看“开发人员指南 > 基本概念 > OSS基本概念介绍”。
    // Bucket命名规范如下：只能包括小写字母，数字和短横线（-），必须以小写字母或者数字开头，长度必须在3-63字节之间。
    private static String bucketName = "bidr";

    // Object是OSS存储数据的基本单元，称为OSS的对象，也被称为OSS的文件。详细描述请参看“开发人员指南 > 基本概念 > OSS基本概念介绍”。
    // Object命名规范如下：使用UTF-8编码，长度必须在1-1023字节之间，不能以“/”或者“\”字符开头。
    private static String firstKey = "my-first-key";
    
    public static void uploadFile(String path,String contentType,File file){
    	InputStream inputStream;
    	OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		try {
			inputStream = new BufferedInputStream(new FileInputStream(file));
	        ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(contentType);
			objectMetadata.setContentLength(file.length());
			PutObjectResult result=ossClient.putObject(bucketName, StringUtils.removeStart(path, "/"), inputStream, objectMetadata);
			System.out.println(result);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 关闭OSSClient。
       ossClient.shutdown();
    }
    /**
     * 下载路径
     * @param path
     * @param downLoadPath
     */
    public static void downloadFile(String path,String downLoadPath){
    	OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
    	OSSObject ossObject = ossClient.getObject(bucketName, StringUtils.removeStart(path, "/"));
    	ossClient.getObject(new GetObjectRequest(bucketName, StringUtils.removeStart(path, "/")), new File(downLoadPath));;
    	// 关闭OSSClient。
    	ossClient.shutdown();
    }

	public static String getUrl(String path) {
		return preFixx +"/"+ path;
	}

}
