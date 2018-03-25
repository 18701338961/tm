package com.tm.eum.util;

public enum FileGroupEnum {
	
	FLIGHT(0,"MN10-1 纳卫星",""),
/*	FLIGHT(0,"MS-1-3U立方星",""),*/
/*	STAR(1,"MS-2-6U立方星",""),*/
	CONTROL(2,"HN-1微小卫星",""),
/*	FLIGHT1(3,"MS-3小卫星",""),*/
	STAR1(4,"Ka通信微小卫星",""),
	CONTROL1(5,"聚划算微小卫星",""),
	STAR2(6,"FN-600P-A卫通便携站",""),
	CONTROL2(7,"FN-1000Z-A双频便携站",""),
	FLIGHT2(8,"Ku机载动中通",""),
	STAR3(9,"sPhone-F1天通卫星手机",""),
	CONTROL3(10,"舒拉亚数据终端","");
	
	public int code;
	public String desc;
	public String demo;
	
	FileGroupEnum(int code,String desc,String demo) {
		this.code = code;
		this.desc = desc;
		this.demo = demo;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getDemo() {
		return demo;
	}

	public void setDemo(String demo) {
		this.demo = demo;
	}
	
	public static FileGroupEnum getByCode(Integer code) {
        if (code != null) {
            for (FileGroupEnum fileGroup : FileGroupEnum.values()) {
                if (code == fileGroup.getCode()) {
                    return fileGroup;
                }
            }
        }
        return null;
    }
	
	public static String getDescByCode(Integer code) {
        if (code != null) {
            for (FileGroupEnum fileGroup : FileGroupEnum.values()) {
                if (code == fileGroup.getCode()) {
                    return fileGroup.getDesc();
                }
            }
        }
        return null;
    }

}
