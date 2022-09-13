package com.iroc.spring.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class Utils {

    public static String generateRandomStringByUUID() {
        return UUID.randomUUID().toString();
    }

    public static String upload(MultipartFile file, String fileFileName, HttpServletRequest request) throws Exception {
        double randomname = Math.random();
        String random = randomname + "";
        random = random.replaceAll("0.", "");
        if (fileFileName.contains(" ")) {
            fileFileName = fileFileName.replaceAll(" ", "");
        }
        // the directory to upload to
//        request.getServletContext()
        String uploadDir = request.getServletContext().getRealPath("/uploads") + "/";

        // write the file to the file specified
        File dirPath = new File(uploadDir);

        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }

        // retrieve the file data
        InputStream stream = file.getInputStream(); //  new FileInputStream(file);

        // write the file to the file specified
        OutputStream bos = new FileOutputStream(uploadDir + random + fileFileName);
        int bytesRead;
        byte[] buffer = new byte[8192];

        while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
            bos.write(buffer, 0, bytesRead);
        }

        bos.close();
        stream.close();

        // place the data into the request for retrieval on next page
        request.setAttribute("location", dirPath.getAbsolutePath() + "/" + fileFileName);
        // log.debug("location" + dirPath.getAbsolutePath() + "/" +
        // fileFileName);

        String link = request.getContextPath() + "/uploads" + "/";

        request.setAttribute("link", link + fileFileName);
        // log.debug("link" + link + fileFileName);

        return link + random + fileFileName;
    }
}
