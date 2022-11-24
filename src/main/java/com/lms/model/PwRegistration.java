package com.lms.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class PwRegistration {
	public PwRegistration() {};
    public PwRegistration(String userID) {
        this.id = userID;
    }

    @NotEmpty
    String  id;

    @NotEmpty(message="기존 비밀번호를 입력하세요")
    String password;

    @NotEmpty(message="신규 비밀번호를 입력하세요")
    @Size(min=6, max=12, message="6 자리 이상 12 자리 이하이어야 합니다.")
    String editPassword1;
    
    @NotEmpty(message="신규 비밀번호를 재입력하세요")
    String editPassword2;
}
