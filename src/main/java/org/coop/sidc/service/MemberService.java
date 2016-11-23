package org.coop.sidc.service;

import org.coop.sidc.domain.Member;

public interface MemberService {
	public Member save(Member member);
	public Member get(Long id);
}
