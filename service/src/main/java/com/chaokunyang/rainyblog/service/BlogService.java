package com.chaokunyang.rainyblog.service;

import com.chaokunyang.rainyblog.model.Blog;

/**
 * 博客Service
 *
 * @author chaokunyang
 * @create 2017/2/11
 */
public interface BlogService {
    Blog get(String id);
    Blog save(Blog blog);
}
