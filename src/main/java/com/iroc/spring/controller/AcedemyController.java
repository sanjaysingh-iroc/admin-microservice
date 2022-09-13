package com.iroc.spring.controller;

import com.iroc.spring.entity.AcedemyDetails;
import com.iroc.spring.payload.UploadFileResponse;
import com.iroc.spring.services.AcedemyService;
import com.iroc.spring.services.FileStorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.file.Path;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/acedemy")
@Slf4j
public class AcedemyController {

    @Autowired
    AcedemyService acedemyService;

    @Autowired
    FileStorageService fileStorageService;


    @PostMapping(value = "/create")
    public ResponseEntity<AcedemyDetails> createAcedemyDetails(@RequestBody AcedemyDetails acedemyDetails) {
        try {
            acedemyDetails = acedemyService.updateAcedemyDetails(acedemyDetails);

            return new ResponseEntity<>(acedemyDetails, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping(value = "/getAcedemyDetails")
    public ResponseEntity<AcedemyDetails> getAcedemyDetails() {
        try {
            AcedemyDetails acedemyDetails = acedemyService.getAcedemyDetails();
            return new ResponseEntity<>(acedemyDetails, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/uploadFile")
    public UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file) {
        Path fileStorageLocation = fileStorageService.createFileStorageLocation("acedemy");

        String fileName = fileStorageService.storeFile(file, fileStorageLocation);
        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/acedemy/downloadFile/")
                .path(fileName)
                .toUriString();

        return new UploadFileResponse(fileName, fileDownloadUri,
                file.getContentType(), file.getSize());
    }

    @RequestMapping(path = "/downloadFile/{fileName:.+}", method = RequestMethod.GET)
    public ResponseEntity<Resource> downloadFile(@PathVariable("fileName") String fileName, HttpServletRequest request) {
        Path fileStorageLocation = fileStorageService.createFileStorageLocation("acedemy");

        // Load file as Resource
        Resource resource = fileStorageService.loadFileAsResource(fileName, fileStorageLocation);

        // Try to determine file's content type
        String contentType = null;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException ex) {
//            logger.info("Could not determine file type.");
        }

        // Fallback to the default content type if type could not be determined
        if (contentType == null) {
            contentType = "application/octet-stream";
        }
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

}
