package com.power.school.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.power.school.entity.UserSubscribedCourse;

public interface UserSubscribedCourseRepository extends JpaRepository<UserSubscribedCourse, Long>{
}
