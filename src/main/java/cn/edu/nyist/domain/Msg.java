package cn.edu.nyist.domain;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private int code;
    private String msg;
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理成功");
        return msg;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setMsg("处理失败!");
        result.setCode(400);
        return result;
    }

    public Msg add(String key, Object value){
        this.getExtend().put(key,value);
        return this;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
