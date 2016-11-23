package org.coop.sidc.serviceimpl;

import org.coop.sidc.domain.Member;
import org.coop.sidc.repositories.MemberRepository;
import org.coop.sidc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberRepository memberRepository;
	
	@Override
	public Member save(Member member) {
		member=memberRepository.save(member);
		return member;
	}

	@Override
	public Member get(Long id) {
		return memberRepository.findOne(id);
	}

}
