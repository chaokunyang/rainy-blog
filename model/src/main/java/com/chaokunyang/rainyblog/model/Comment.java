package com.chaokunyang.rainyblog.model;

import java.io.Serializable;
import java.time.Instant;

/**
 * 评论
 *
 * @author chaokunyang
 * @create 2017/2/11
 */
public class Comment implements Serializable {
    private Long id;
    private Instant dateCreated;
    private String body;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Instant getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Instant dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}