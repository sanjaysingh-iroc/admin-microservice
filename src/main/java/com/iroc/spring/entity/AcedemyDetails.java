package com.iroc.spring.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@Getter
@Setter
@Table(name = "acedemy_details")
public class AcedemyDetails implements Serializable {

    @Id
    @Column(name = "acedemy_details_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "acedemy_name")
    private String acedemyName;

    @Column(name = "establishment_date")
    private String establishmentDate;

    @Column(name = "email")
    private String email;

    @Column(name = "mobile")
    private String mobile;

    @Column(name = "phone_no")
    private String phoneNo;


    @Column(name = "address")
    private String address;

    @Column(name = "logo_img")
    private String logoImg;

}
