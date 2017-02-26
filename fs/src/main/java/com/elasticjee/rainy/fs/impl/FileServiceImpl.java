package com.elasticjee.rainy.fs.impl;

import com.elasticjee.rainy.fs.FileService;
import com.elasticjee.rainy.fs.domain.Attachment;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

/**
 * @author chaokunyang
 * @create 2017/2/24
 */
public class FileServiceImpl implements FileService {
    @Override
    public String save(Attachment attachment) throws IOException {
        String uuid = UUID.randomUUID().toString();
        String fileName = "/rainy/file/" + uuid + "-" + attachment.getName();
        Files.write(Paths.get(fileName), attachment.getContents());
        return fileName;
    }

    @Override
    public Attachment get(String path) throws IOException {
        Path filePath = Paths.get(path);
        byte[] content = Files.readAllBytes(filePath);
        return new Attachment(filePath.getFileName().toString(), content);
    }

    @Override
    public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getParameter("path");
        Attachment attachment = get(path);
        if (attachment == null) return;

        response.setHeader("Content-Disposition", "attachment; filename=" + attachment.getName());
        response.setContentType("application/octet-stream");

        ServletOutputStream stream = response.getOutputStream();
        stream.write(attachment.getContents());
    }
}
