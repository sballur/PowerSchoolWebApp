package com.power.school.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.school.entity.User;
import com.power.school.entity.UserSubscribedCourse;
import com.power.school.repository.UserRepository;
import com.power.school.repository.UserSubscribedCourseRepository;

@Service
public class UserSubscribedCourseService {
    @Autowired
    private UserSubscribedCourseRepository userSubscribedCourseRepository;
    @Autowired
    private UserRepository userRepository;

    public UserSubscribedCourse save(String username, String accessCode) {
    	User user = userRepository.findByUsername(username);
    	Set<User> users = new HashSet<>();
    	users.add(user);
    	UserSubscribedCourse userSubscripedCourse = new UserSubscribedCourse();
    	userSubscripedCourse.setName(accessCode);
    	userSubscripedCourse.setUsers(users);
    	userSubscripedCourse = userSubscribedCourseRepository.save(userSubscripedCourse);
    	return userSubscripedCourse;
    }
}
