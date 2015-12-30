package first.common.controller;
 
import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.common.common.CommandMap;
import first.common.service.CommonService;

 
@Controller
public class CommonController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="commonService")
    private CommonService commonService;
    
    @RequestMapping(value="/common/downloadFile.do")
    public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
        Map<String,Object> map = commonService.selectFileInfo(commandMap.getMap());
        String storedFileName = (String)map.get("stored_file_name");
        String originalFileName = (String)map.get("original_file_name");
        
        byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/Users/kimgh6554/Documents/Dev/File/"+storedFileName)); //mac
        //byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName)); //window
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
         
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
}
