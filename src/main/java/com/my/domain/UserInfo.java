package com.my.domain;

/**
 * 类名称：
 * 类描述：
 *
 * @author DongXHL(今晓)
 * 单位：
 * 联系方式：QQ(415235631)
 * @create 2019-05-14-9:57
 */
public class UserInfo {
    private String userId;
    private String name;
    private String rights;
    private String loginStatus;
    private String skin;
    private String signature;
    private String lastLoginDate;
    private String lastLoginIp;
    private String profilePhoto;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRights() {
        return rights;
    }

    public void setRights(String rights) {
        this.rights = rights;
    }

    public String getLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(String loginStatus) {
        this.loginStatus = loginStatus;
    }

    public String getSkin() {
        return skin;
    }

    public void setSkin(String skin) {
        this.skin = skin;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(String lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", rights='" + rights + '\'' +
                ", loginStatus='" + loginStatus + '\'' +
                ", skin='" + skin + '\'' +
                ", signature='" + signature + '\'' +
                ", lastLoginDate='" + lastLoginDate + '\'' +
                ", lastLoginIp='" + lastLoginIp + '\'' +
                ", profilePhoto='" + profilePhoto + '\'' +
                '}';
    }
}
