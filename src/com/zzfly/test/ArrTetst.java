package com.zzfly.test;

import java.util.ArrayList;
import java.util.List;

public class ArrTetst {
	// private StringBuilder sb = new StringBuilder();
	private List<String> lSArr = new ArrayList<String>();

	public List<StringBuilder> test01(String[] s, List<StringBuilder> lsb,
			int col) {
		List<StringBuilder> lnsb = new ArrayList<StringBuilder>();
		if (lsb != null) {
			for (String ss : s) {
				for (StringBuilder sb : lsb) {
					sb.append(ss);
					lnsb.add(sb);
				}
			}
		} else {
			lsb = new ArrayList<StringBuilder>();
			for (String ss : s) {
				StringBuilder sb = new StringBuilder();
				sb.append(ss);
				lnsb.add(sb);
			}
			if (col != 0) {
				lnsb = test01(s, lnsb, col - 1);
			}
		}

		return lnsb;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrTetst at = new ArrTetst();
		String[] sa = { "0", "1" };
		List<StringBuilder> ll;
		ll = at.test01(sa, null, 3);
		System.out.println(ll.toString());
	}

}
