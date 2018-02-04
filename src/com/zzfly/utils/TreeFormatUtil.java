package com.zzfly.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zzfly.easyui.Tree;
import com.zzfly.model.Func;
import com.zzfly.model.UserInfo;

/**
 * 生成树的工具类
 * 
 * @author zhengz.fly
 * 
 */
public class TreeFormatUtil {
	/**
	 * 功能菜单树
	 * 
	 * @param resources
	 * @return
	 */
	public static Collection<Tree> funcToTree(Collection<Func> resources) {
		List<Tree> tree = new ArrayList<Tree>();
		List<Tree> treeFomat = new ArrayList<Tree>();
		for (Func resource : resources) {
			Tree node = new Tree();
			node.setId(resource.getFuncId().toString());
			node.setText(resource.getFuncSNme());
			Map<String, String> attributes = new HashMap<String, String>();
			attributes.put("funcCode", resource.getFuncCode());
			attributes.put("funcNme", resource.getFuncNme());
			attributes.put("pFuncCode", resource.getpFuncCode());
			attributes.put("funcImg", resource.getFuncImg());
			attributes.put("url", resource.getFuncUrl());
			attributes.put("funcSts", resource.getFuncSts());
			attributes.put("creDate",
					DateUtil.dateToString(resource.getCreDate()));
			attributes.put("updDate",
					DateUtil.dateToString(resource.getUpdDate()));
			node.setAttributes(attributes);
			node.setIconCls(null);
			node.setPid(resource.getpFuncId() == null ? null : resource
					.getpFuncId().toString());
			tree.add(node);
		}
		for (Tree node1 : tree) {
			boolean mark = false;
			for (Tree node2 : tree) {
				if (node1.getPid() != null
						&& node1.getPid().equals(node2.getId())) {
					mark = true;
					if (node2.getChildren() == null)
						node2.setChildren(new ArrayList<Tree>());
					node2.getChildren().add(node1);
					break;
				}
			}
			if (!mark) {
				treeFomat.add(node1);
			}
		}
		return treeListSort(treeFomat);
	}

	/**
	 * 用户树
	 * 
	 * @param resources
	 * @return
	 */
	public static Collection<Tree> userToTree(Collection<UserInfo> resources) {
		List<Tree> tree = new ArrayList<Tree>();
		List<Tree> treeFomat = new ArrayList<Tree>();
		for (UserInfo resource : resources) {
			Tree node = new Tree();
			node.setId(resource.getuId().toString());
			node.setText(resource.getuNme());
			Map<String, String> attributes = new HashMap<String, String>();
			attributes.put("uCode", resource.getuCode());
			node.setAttributes(attributes);
			node.setIconCls("icon-user");
			node.setPid(resource.getuPId() == null ? null : resource.getuPId()
					.toString());
			tree.add(node);
		}
		for (Tree node1 : tree) {
			boolean mark = false;
			for (Tree node2 : tree) {
				if (node1.getPid() != null
						&& node1.getPid().equals(node2.getId())) {
					mark = true;
					if (node2.getChildren() == null)
						node2.setChildren(new ArrayList<Tree>());
					node2.getChildren().add(node1);
					break;
				}
			}
			if (!mark) {
				treeFomat.add(node1);
			}
		}
		return treeFomat;
	}

	/**
	 * 菜单树节点排序
	 * 
	 * @param lt
	 * @return
	 */
	public static Collection<Tree> treeListSort(List<Tree> lt) {
		Comparator<Tree> comparator = new Comparator<Tree>() {// 自定义排序

			@Override
			public int compare(Tree o1, Tree o2) {
				return o1.getId().compareTo(o2.getId());
			}
		};
		Collections.sort(lt, comparator);
		return lt;
	}
}