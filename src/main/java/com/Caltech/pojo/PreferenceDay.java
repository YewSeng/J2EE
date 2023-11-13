package com.Caltech.pojo;

public enum PreferenceDay {
	   WEEKEND("Weekend Class"),
	   WEEKDAY("Weekday Class");

	   private String customName;

	   private PreferenceDay(String customName) {
	       this.customName = customName;
	   }

	   public String getCustomName() {
	       return customName;
	   }
}
