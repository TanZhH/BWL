package Entities;

/**
 * Created by CWZZ on 2016/12/19.
 */
public class Reb {
    private int rebID;
    private String content;
    private String createTime;
    private String lastModTime;

    public int getRebID() {
        return rebID;
    }

    public void setRebID(int rebID) {
        this.rebID = rebID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastModTime() {
        return lastModTime;
    }

    public void setLastModTime(String lastModTime) {
        this.lastModTime = lastModTime;
    }
}
