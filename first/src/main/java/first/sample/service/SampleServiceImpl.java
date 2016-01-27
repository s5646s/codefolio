package first.sample.service;

import java.util.Map.Entry;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.eclipse.jgit.api.Git;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.common.util.FileUtils;
import first.common.util.GitUtils;
import first.common.util.ZipUtils;
import first.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="zipUtils")
	private ZipUtils zipUtils;
	
	@Resource(name="gitUtils")
	private GitUtils gitUtils;
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
		
	}

	@Override
	public void insertBoard(Map<String, Object> map,HttpServletRequest request) throws Exception {
		
		sampleDAO.insertBoard(map);
		    
//		  Iterator<Entry<String,Object>> iterator2 = map.entrySet().iterator();
//	        Entry<String,Object> entry = null;
//	        log.debug("--------------------printMap--------------------\n");
//	        while(iterator2.hasNext()){
//	        entry = iterator2.next();
//	        log.debug("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
//	        }
//	        log.debug("");
//	        log.debug("------------------------------------------------\n");
	        
	        
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			sampleDAO.insertFile(list.get(i)); //db에저장 (임시방편 )
			}
		
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		sampleDAO.updateHitCnt(map);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = sampleDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = sampleDAO.selectFileList(map);
		resultMap.put("list",list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception{
		sampleDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		sampleDAO.deleteBoard(map);
	}

	@Override
	public String gitStore(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		String result= "";
		String projectName="";
		String file = (String) map.get("file");
		projectName = zipUtils.makegit(map, request);
		log.debug("projectName : "+projectName );
			result = gitUtils.getProjectList(projectName, 4);
			map.put("projectName", projectName);
		
			sampleDAO.insertProject(map);
			return result;
	}

}
