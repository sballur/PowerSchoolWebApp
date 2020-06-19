package com.power.school.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.power.school.entity.User;
import com.power.school.entity.UserSubscribedCourse;
import com.power.school.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        if(null != user && null != user.getCourses()) {
        	for (UserSubscribedCourse role : user.getCourses()){
        		grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        	}
        }
        if(null != user)
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
        return null;
    }
}
