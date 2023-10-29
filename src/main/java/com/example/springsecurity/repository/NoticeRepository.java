package com.example.springsecurity.repository;

import java.util.List;

import com.example.springsecurity.model.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {
	
	@Query(value = "from Notice n where current_date() BETWEEN n.noticeBeginDate AND n.noticeEndDate")
	List<Notice> findAllActiveNotices();

}