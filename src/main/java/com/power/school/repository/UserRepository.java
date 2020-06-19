package com.power.school.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.power.school.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
