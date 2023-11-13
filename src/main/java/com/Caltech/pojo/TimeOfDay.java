package com.Caltech.pojo;

public enum TimeOfDay {
    MORNING("Morning Class"),
    AFTERNOON("Afternoon Class"),
    EVENING("Evening Class");

    private String customName;

    private TimeOfDay(String customName) {
        this.customName = customName;
    }

    public String getCustomName() {
        return customName;
    }
}
