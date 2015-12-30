package first.sample.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
	    insert("sample.insertFile", map); 	//파일입력 
	}
	
	
	
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("sample.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("sample.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		
		Iterator<Entry<String,Object>> iterator2 = map.entrySet().iterator();
        Entry<String,Object> entry = null;
        log.debug("——————————printMap——————————\n");
        while(iterator2.hasNext()){
        entry = iterator2.next();
        log.debug("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
        }
        log.debug("");
        log.debug("————————————————————————\n");
        
	    return (List<Map<String, Object>>)selectList("sample.selectFileList", map); //파일 리스트 저장 
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception{
		update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("sample.deleteBoard", map);
	}

}
