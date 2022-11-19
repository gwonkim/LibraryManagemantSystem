package com.lms.model;

import lombok.Data;

@Data
public class Pagination {
    int pg = 1; // 현재 페이지
    int sz = 6; // 페이지 당 레코드 수, 짝수로 할 것
    String srchTarget; // 검색 타켓
    String keyword = ""; // 검색 키워드
    int recordCount; // 전체 레코드 수

    public String getQueryString() {
        return String.format("pg=%d&sz=%d&keyword=%d", pg, sz, keyword);
    }
}
