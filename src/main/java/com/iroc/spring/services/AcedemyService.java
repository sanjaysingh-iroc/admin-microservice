package com.iroc.spring.services;

import com.iroc.spring.entity.AcedemyDetails;
import com.iroc.spring.repository.AcedemyRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class AcedemyService {

    @Autowired
    AcedemyRepository acedemyRepository;

    public AcedemyDetails updateAcedemyDetails(AcedemyDetails acedemyDetails) {
        AcedemyDetails acedemyDetails1 = getAcedemyDetails();
        if (acedemyDetails1 != null) {
            acedemyDetails.setId(acedemyDetails1.getId());
        }
        return acedemyRepository.save(acedemyDetails);
    }

    public AcedemyDetails getAcedemyDetails() {
        List<AcedemyDetails> acedemyDetailsList = acedemyRepository.findAll();
        if (!acedemyDetailsList.isEmpty()) {
            return acedemyDetailsList.get(0);
        }
        return null;
    }
}
