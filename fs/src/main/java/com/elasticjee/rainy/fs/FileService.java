package com.elasticjee.rainy.fs;

import com.elasticjee.rainy.fs.domain.Attachment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 文件服务
 *
 * @author chaokunyang
 * @create 2017/2/24
 */
public interface FileService {

    /**
     *
     * @param attachment
     * @return 返回文件路径
     */
    String save(Attachment attachment) throws IOException;

    Attachment get(String path) throws IOException;

    void download(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
