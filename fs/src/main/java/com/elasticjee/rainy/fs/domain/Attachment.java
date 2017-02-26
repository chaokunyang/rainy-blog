package com.elasticjee.rainy.fs.domain;

/**
 * 附件
 *
 * @author chaokunyang
 * @create 2017/2/24
 */
public class Attachment {

    private String name;

    private byte[] contents;

    public Attachment() {
    }

    public Attachment(String name, byte[] contents) {
        this.name = name;
        this.contents = contents;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getContents() {
        return contents;
    }

    public void setContents(byte[] contents) {
        this.contents = contents;
    }
}
