package com.example.wechat.enums;

import lombok.Getter;

@Getter
public enum  PayStatusEnum {
    WAIT(0,"等待支付"),
    SUCCESS(1,"支付成功");

    private int code;
    private String message;

    PayStatusEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }
}
