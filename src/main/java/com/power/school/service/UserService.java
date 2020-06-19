package com.power.school.service;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.power.school.entity.User;
import com.power.school.entity.UserSubscribedCourse;
import com.power.school.repository.UserRepository;
import com.power.school.repository.UserSubscribedCourseRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserSubscribedCourseRepository userSubscribedCourseRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setCourses(new HashSet<>(userSubscribedCourseRepository.findAll()));
        userRepository.save(user);
    }
    
    public void update(String username, UserSubscribedCourse userSubscripedCourse) {
    	User user = userRepository.findByUsername(username);
    	user.getCourses().add(userSubscripedCourse);
        userRepository.save(user);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
