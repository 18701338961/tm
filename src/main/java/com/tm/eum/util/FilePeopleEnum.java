package com.tm.eum.util;

public enum FilePeopleEnum {

	FLIGHTPEOPLE(0,"孔令波",""),
	STARPEOPLE(1,"郭立业",""),
	CONTROLPEOPLE(2,"刁占林",""),
	FLIGHT1PEOPLE(3,"林见杰",""),
	FLIGHT2PEOPLE(4,"常武军",""),
	STAR2PEOPLE(5,"刘断尘",""),
	CONTROL2PEOPLE(6,"梁军民","");
	
	
	public int code;
	public String desc;
	public String demo;
	
	FilePeopleEnum(int code,String desc,String demo) {
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
	
	public static FilePeopleEnum getByCode(Integer code) {
        if (code != null) {
            for (FilePeopleEnum filePeople : FilePeopleEnum.values()) {
                if (code == filePeople.getCode()) {
                    return filePeople;
                }
            }
        }
        return null;
    }
	
	public static String getDescByCode(Integer code) {
        if (code != null) {
            for (FilePeopleEnum filePeople : FilePeopleEnum.values()) {
                if (code == filePeople.getCode()) {
                    return filePeople.getDesc();
                }
            }
        }
        return null;
    }
		
}
