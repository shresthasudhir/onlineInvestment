package org.coop.sidc.serviceimpl;

import java.util.List;

import org.coop.sidc.domain.Credential;
import org.coop.sidc.repositories.CredentialRepository;
import org.coop.sidc.service.CredentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CredentialServiceImpl implements CredentialService{
	@Autowired
	CredentialRepository credentialRepository;
	
	@Override
	public Credential save(Credential credential) {
		return credentialRepository.save(credential);
	}

	@Override
	public List<Credential> getList() {		
		return (List<Credential>)credentialRepository.findAll();
	}

	@Override
	public Credential get(Long id) {		
		return credentialRepository.findOne(id);
	}

	@Override
	public void delete(Long id) {
		credentialRepository.delete(id);		
	}

	@Override
	public Credential findByUsername(String username) {
		return credentialRepository.findByUsername(username);
	}
	
}
