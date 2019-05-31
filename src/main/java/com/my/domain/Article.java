package com.my.domain;

/**
 * 类名称：文章类
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-24-15:15
 */
public class Article {
    private String id;
    private String title;
    private String url;
    private String icon;
    private String summary;
    private String author;
    private String createDate;
    private String comment;
    private String browse;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getBrowse() {
        return browse;
    }

    public void setBrowse(String browse) {
        this.browse = browse;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", url='" + url + '\'' +
                ", icon='" + icon + '\'' +
                ", summary='" + summary + '\'' +
                ", author='" + author + '\'' +
                ", createDate='" + createDate + '\'' +
                ", comment='" + comment + '\'' +
                ", browse='" + browse + '\'' +
                '}';
    }
}
