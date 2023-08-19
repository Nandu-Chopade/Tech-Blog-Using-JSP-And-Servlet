
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    public static boolean deleteFile(String path){
        boolean f = false;
        try {
             File file = new File(path);
             f = file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public static boolean saveFile(InputStream is, String path){
        boolean f= false;
        try {
            // creating byte type variable checking available bytes in is file 
            byte b[] = new byte[is.available()];
//            reading byte
            is.read(b);
            // creating obj
            FileOutputStream fos = new FileOutputStream(path);
            // writing file in folder and means copying 
            fos.write(b);
            //flush file
            fos.flush();
            fos.close();
            f= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
