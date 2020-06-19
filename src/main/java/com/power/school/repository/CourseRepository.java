package com.power.school.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.power.school.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long>{
}
