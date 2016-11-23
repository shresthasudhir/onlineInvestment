package org.coop.sidc.repositories;

import org.coop.sidc.domain.Credential;
import org.springframework.data.repository.CrudRepository;

public interface CredentialRepository extends CrudRepository<Credential,Long>{
	public Credential findByUsername(String username);
}
