public with sharing class BoletinDataService {

    @AuraEnabled(Cacheable=true)
	public static List<Calificacion__c> getCalificaciones(String boletinId) {
        List<Calificacion__c> listaDeCalificaciones = [SELECT Id, Materia__r.Name, Primer_trimestre__c, Segundo_trimestre__c, Tercer_trimestre__c
                                                       FROM Calificacion__c
                                                       WHERE Boletin__c = :boletinId];
        return listaDeCalificaciones;
    }

    @AuraEnabled(Cacheable=true)
	public static List<Inasistencia__c> getInasistencias(String boletinId) {
        List<Inasistencia__c> listaDeInasistencias = [SELECT Id, Primer_trimestre__c, Segundo_trimestre__c, Tercer_trimestre__c
                                                      FROM Inasistencia__c
                                                      WHERE Boletin__c = :boletinId];
        return listaDeInasistencias;
    }

    @AuraEnabled
	public static String updateCalificacion(Object data) {
    	List<Calificacion__c> calificacionesForUpdate = (List<Calificacion__c>) JSON.deserialize(
        	JSON.serialize(data),
        	List<Calificacion__c>.class
    	);
		update calificacionesForUpdate;
    	return 'Boletín actualizado';
	}

    @AuraEnabled
	public static String updateInasistencia(Object data) {
    	List<Inasistencia__c> inasistenciaForUpdate = (List<Inasistencia__c>) JSON.deserialize(
        	JSON.serialize(data),
        	List<Inasistencia__c>.class
    	);
		update inasistenciaForUpdate;
    	return 'Inasistencia actualizada';
	}
}