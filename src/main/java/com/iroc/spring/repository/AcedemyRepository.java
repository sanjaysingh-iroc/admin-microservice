package com.iroc.spring.repository;

import com.iroc.spring.entity.AcedemyDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AcedemyRepository extends JpaRepository<AcedemyDetails, Integer> {
}
